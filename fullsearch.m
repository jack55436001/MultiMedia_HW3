function [ resi_img,result_img ] = fullsearch(refer_img,target_img,ranges,sizes)
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
            for k=top:bot
                for m=left:right
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

