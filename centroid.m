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
plot(513-dw(:,1),513-dw(:,2),'*');
y =[513-((max(dw(:,1))-min(dw(:,1)))/2+min(dw(:,1))),513-((max(dw(:,2))-min(dw(:,2)))/2+min(dw(:,2)))]
hold on
plot(y(:,1),y(:,2),'*');
hold off
