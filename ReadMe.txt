CODE與report放在主資料夾底下
其餘生成的圖片放在data資料夾裡(包括原本的圖片)
生成圖片分為兩種，一種是助教需要的 residual images ，另外一種
是方便我觀看的result images(predict images)
格式是.jpg
演算法縮寫
FULL SEARCH = fs
2D logarithmic search = 2d
bi-directional prediction(use 2D logarithmic search) = bi2d
------------------------------------------------------------------------------------------------
residual images 命名方式是
r_演算法_SearchRange_BlockSizes_TargetImage
EX:	Block size 8X8	Search range 8	Target image frame73	FULL SEARCH
則命名結果為  rfs8873
-------------------------------------------------------------------------------------------------
result images 命名方式是
演算法_SearchRange_BlockSizes_TargetImage
EX:	Block size 8X8	Search range 8	Target image frame73	FULL SEARCH
則命名結果為  fs8873
**************************************************************************
Q1.a 	執行 	HW3_Q1_FRAME73.m
(Terminal會顯示測試圖片使用的Block size	Serach range	演算法     Total SAD
PSNR)
**************************************************************************
Q1.b	執行	HW3_Q1_FRAME81.m
(Terminal會顯示測試圖片使用的Block size	Serach range	演算法	    Total SAD
PSNR)
**************************************************************************
Q2	執行	HW3_Q2.m
(Terminal會顯示測試圖片使用的Block size	Serach range	演算法     Total SAD
PSNR)
**************************************************************************