function y = centroid(img)
a = imread(img);
bw = a < 60;
dw = [0,0];

for i = 1:512
	for j = 1:512
		if bw(i,j) == 0
			val = [i,j];
			dw = vertcat(dw,val);
		end
	end
end
dw = dw(2:end,:);
y =[513-((max(dw(:,1))-min(dw(:,1)))/2+min(dw(:,1))),513-((max(dw(:,2))-min(dw(:,2)))/2+min(dw(:,2)))];
imshow(a);
gp = ginput(1)
res = vertcat(y,gp)
colour = {'red', 'green'};
RGB = insertMarker(a, res, 'color' ,colour);
imshow(RGB)
disp(['Manual Input is ',num2str(gp),'. The Algorithm code gives ', num2str(y)])
% hold on
% lw = plot(y(:,1),y(:,2),'*');
% c = imfuse(a,y,'blend');
% imshow(c)
