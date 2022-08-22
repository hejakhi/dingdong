% Single-Layer Perceptron to implement AND, %OR and XOR logical Operations
clear all;
close all;
clc
init_weight_scale = 0.01;
eta = 0.05;lemda=1;
x = [0 0 1 1; 0 1 0 1; -1 -1 -1 -1];
%xx = [0 0 1 1; 0 1 0 1];
da = [0 0 0 1 ];
%da = [0 1 1 0];
%dc = [-1 1 1 -1];
dc_bx=[-1.5 -1 0 1 2];
dc_bd=[];
dc_by=0;
 
[len_x, nSample] = size(x);
[len_y, nSample] = size(da);
rand('state',2);
%num_hid_neuron = 1;
% W = cell(3);
% H = zeros(1,4);
% y = zeros(1,4);
% delta = cell(2);
WW=[];
W= init_weight_scale*(rand(1,3)-0.5);
y=zeros(1,4);
delta=zeros(1,3);
 
%initialization
% W{1} = init_weight_scale*(rand(1,2)-0.5);
% W{2} = init_weight_scale*(rand(1,1)-0.5);
% W{3} = init_weight_scale*(rand(1,2)-0.5);
slop=-1*W(1,1)/W(1,2);
for pp=1:5
    dc_by(pp)=slop*dc_bx(pp)+W(1,3)/W(1,2);
end
dc_bd=[dc_bd;dc_by];
 
niter = 10000;
disp('epoch      error');
for i=1:niter
    % forward passing
    h=W*x;
    y = sigmoid(h,lemda);
    e = da - y;
    
    %backward passing
    
    f_d =0.5*(e.*(1-y.^2));
    delta =f_d*x';
    W=W+eta*delta;
    WW=[WW;W];
    % display error
    error(i) = sse(e(:))/nSample;
    if mod(i,1000)==0 
        disp(sprintf('%4d \t %f', i, error(i)));
        %WW=[WW;W];
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
% disp('W{2}: from hidden to output');
% disp(W{2});
% disp('W{3}: from input to output');
% disp(W{3});
 
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
%legend('1-st','1k-th','2k-th','8k-th','10k-th');
title('Decision Boundary');
xlabel('X co-ordinate');
ylabel('Y co-ordinate');
 
 
  x1=[0;0 ];
  x2=[0 1 1;1 0 1];
% 
 figure(4); hold on;
  plot(x1(1,:), x1(2,:), 'b*');
%  %axis([0 4 0 4]);
  plot(x2(1,:), x2(2,:), 'r+');
%  axis([0 4 0 4]);
%  xlabel('X-value'); ylabel('Y-value');title('Data Distribution');
legend('1-st','1k-th','2k-th','8k-th','10k-th','class1','class2');
hold off;


