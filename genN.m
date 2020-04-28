function [N] = genN(size,width,height)
    rand('seed',5);
    N = rand(size,1) * width;
    N = [N rand(size,1) * height];
end