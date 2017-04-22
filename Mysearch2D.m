function [ resi_img,result_img ] = Mysearch2D( refer_img,target_img,ranges,sizes )
 [rows ,cols , heights] = size(refer_img);
 result_img = zeros(rows,cols,heights);
    for i=0:sizes:rows-sizes
        for j=0:sizes:cols-sizes
            min = 100000;
            start_i =0;
            start_j =0;
            top = i-ranges;
            bot = top + 2*ranges;
            left = j-ranges;
            right = left + 2*ranges;
            
            if left < 0
                left = 0;
            end
            if top < 0
                top = 0;
            end
            if right+sizes > cols
                right = cols-sizes;
            end
            if  bot+sizes > rows
                bot = rows-sizes; 
            end
            tmp_t = target_img(i+1:i+sizes,j+1:j+sizes,:);
            k = i;
            m = j;
            r = ranges/2;
            while r~=1
                   tmp_r = refer_img(k+1:k+sizes,m+1:m+sizes,:);
                   tmp = abs(tmp_t-tmp_r);
                   SAD = 0;
                   for n=1:sizes*sizes*3
                       SAD = SAD +tmp(n);
                   end
                   if SAD < min
                       min = SAD;
                       start_i = k;
                       start_j = m;
                   end
                   if k-r>=0 && k-r>=top
                        tmp_r = refer_img(k-r+1:k-r+sizes,m+1:m+sizes,:);
                        tmp = abs(tmp_t-tmp_r);
                        SAD = 0;
                        for n=1:sizes*sizes*3
                            SAD = SAD +tmp(n);
                        end
                        if SAD < min
                            min = SAD;
                            start_i = k-r;
                            start_j = m;
                        end
                   end
                   if k+r+sizes<=rows && k+r<=bot
                        tmp_r = refer_img(k+r+1:k+r+sizes,m+1:m+sizes,:);
                        tmp = abs(tmp_t-tmp_r);
                        SAD = 0;
                        for n=1:sizes*sizes*3
                            SAD = SAD +tmp(n);
                        end
                        if SAD < min
                            min = SAD;
                            start_i = k+r;
                            start_j = m;
                        end
                   end
                   if m-r>=0 && m+r>=left
                        tmp_r = refer_img(k+1:k+sizes,m-r+1:m-r+sizes,:);
                        tmp = abs(tmp_t-tmp_r);
                        SAD = 0;
                        for n=1:sizes*sizes*3
                            SAD = SAD +tmp(n);
                        end
                        if SAD < min
                            min = SAD;
                            start_i = k;
                            start_j = m-r;
                        end
                   end
                   if m+r+sizes<=cols && m+r<=right
                        tmp_r = refer_img(k+1:k+sizes,m+r+1:m+r+sizes,:);
                        tmp = abs(tmp_t-tmp_r);
                        SAD = 0;
                        for n=1:sizes*sizes*3
                            SAD = SAD +tmp(n);
                        end
                        if SAD < min
                            min = SAD;
                            start_i = k;
                            start_j = m+r;
                        end
                   end
                   if start_i == k && start_j == m
                      r=r/2;
                   end
                   k = start_i;
                   m = start_j;
            end
            for x=k-1:k+1
               for y=m-1:m+1
                   if x<0 || x+sizes>rows || y<0 || y+sizes>cols
                       continue;
                   end
                   tmp_r = refer_img(x+1:x+sizes,y+1:y+sizes,:);
                   tmp = abs(tmp_t-tmp_r);
                   SAD = 0;
                    for n=1:sizes*sizes*3
                        SAD = SAD +tmp(n);
                    end
                    if SAD < min
                       min = SAD;
                       start_i = x;
                       start_j = y;
                    end
               end
            end
            result_img(i+1:i+sizes,j+1:j+sizes,:) = refer_img(start_i+1:start_i+sizes,start_j+1:start_j+sizes,:);
        end
    end
    resi_img = zeros(rows,cols);
    resi_t = abs(result_img - target_img);
    for i=1:rows
       for j=1:cols
          resi_img(i,j) = resi_t(i,j,1) + resi_t(i,j,2) + resi_t(i,j,3);
       end
    end


end

