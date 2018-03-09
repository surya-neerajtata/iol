function y = centroid(img)

%% Calculation of centroid
% Calculates the centroid of an circular cluster of points by fitting
% to a circle and finding its centre.
%
% Example:
%
% img = 'trial.jpg';
% c = centroid(img);
%
% Read image into a matrix and then strip away red and blue values
%------------------------------------------------------------------

a = imread(img); 
a = a(:,:,2); 

% Convert spots of interest to have a value of 0 
% (points with intensity less than 40 are 1)
%-------------------------------------------------------------------

bw = a < 40;
dw = [];

% Collect and store points of interest in dw (points with value 0)
%-------------------------------------------------------------------

for i = 1:1024
	for j = 1:1280
		if bw(i,j) == 0
			val = [i,j];
			dw = vertcat(dw,val);
		end
	end
end

% Draw a boundary around the points of interest and
% draw a circle of best fit around them.
% The centre and radius of this circle is taken to be the centre
% of the interested region of spots.
%-------------------------------------------------------------------

y = boundary(dw);
circlex = dw(y,1);
circley = dw(y,2);
circlep = horzcat(circlex,circley);
cb = CircleFitByPratt(circlep);
cx = cb(1,1);
cy = cb(1,2);
y = [cx,cy];
yt = [cy,cx];

%% Manual vs Automated centres
% Input manual centre using ginput and plot both manual and calculated 
% centres to check validity of the code
% (for debugging purposes)

% gp = ginput(1)
% res = vertcat(yt,gp);
% colour = {'red', 'green'};
% RGB = insertMarker(a, res, 'color' ,colour);
% imshow(RGB)
% disp(['Manual Input is ',num2str(gp),'. The Algorithm code gives ', num2str(y)])

%% Mark calculated centre on the image
 
%  colour = {'red'};
%  RGB = insertMarker(a, yt, 'color' ,colour);
%  imshow(RGB)
