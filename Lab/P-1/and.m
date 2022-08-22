clear all;
close all;
init_weight_scale = 0.01;
eta = 0.3; lemda = 1;
x = [0 0 1 1;0 1 0 1;-1 -1 -1 -1];
da = [0 0 0 1];
dc_bx = [-1.5 -1 0 1 2];
dc_by = 0;
dc_bd = [];
[len_x, nSample] = size(x);
[len_y, nSample] = size(da);
rand('state',0);
WW = [];
W = init_weight_scale * (rand(1,3)-0.5);
y = zeros(1,4);
delta = zeros(1,3);
slop = - 1 * W(1,1)/W(1,2);
for pp = 1:5
    dc_by(pp) = slop * dc_bx(pp) + W(1,3) / W(1,2);
end
    dc_bd = [dc_bd; dc_by];
niter = 10000;
disp('epoch      error');
for i = 1:niter
    h = W * x;
    y = sigmoid(h, lemda);
    e = da - y;
    f_d = 0.5 * (e .* (1 - y .^ 2));
    delta = f_d * x';
    W = W + eta * delta;
    WW = [WW; W];
    error(i) = sse(e(:)) / nSample;
    if mod(i, 1000) == 0 
        fprintf('%4d \t %f', i, error(i));
        slop=-1*WW(i,1)/WW(i,2);
        for pp=1:5
            dc_by(pp)=slop*dc_bx(pp)+WW(i,3)/WW(i,2);
        end
            dc_bd=[dc_bd;dc_by];
    end 
end
 disp('train result');
 disp('W{1}: from input to Processing Neuron');
 disp(W);
 disp('input');
disp(x);
disp('output');
disp(y);
disp('error');
disp(e);
figure(1);
plot(1:niter, error);axis tight
axis([0 niter 0 .5]);
title('Error convergence Curve');
xlabel('Number of iterations');
ylabel('Error');
 
figure(2); hold on;
 plot(dc_bx,dc_bd(1,:),dc_bx,dc_bd(2,:),dc_bx,dc_bd(3,:),dc_bx,dc_bd(4,:),dc_bx,dc_bd(5,:));
grid on;
title('Decision Boundary');
xlabel('X co-ordinate');
ylabel('Y co-ordinate');
    x1=[0 0 1;0 1 0];
    x2=[1 1];
   plot(x1(1,:),x1(2,:), 'b*'); hold on;
  plot(x2(1,1),x2(1,2), 'r+');
  axis([-0.25 1.5 -0.25 1.5]);
  legend('class1','class2');
hold off;
