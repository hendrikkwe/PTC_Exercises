clear all; clc; close all

% build unit circle
t = 0:2:360; x = [cosd(t);sind(t)];

figure; hold on;
scatter(x(1,:),x(2,:),'b');
plot([0,x(1,1)],[0,x(2,1)],"b-o","LineWidth",2);
hold off; grid on; axis equal; title('Unit circle');

a = 0.7;
A=[1 a; a 1]; 
Ax=A*x;

figure; hold on;
scatter(x(1,:),x(2,:),'b');
plot([0,x(1,1)],[0,x(2,1)],'b-o','LineWidth',2);
scatter(Ax(1,:),Ax(2,:),'r');
plot([0,Ax(1,1)],[0,Ax(2,1)],'r-o','LineWidth',2);
hold off; grid on; axis equal; title('a = 0.7');

a = 0.9;
A=[1 a; a 1]; %Diagonal or any matrix
Ax=A*x;

figure; hold on;
scatter(x(1,:),x(2,:),'b');
plot([0,x(1,1)],[0,x(2,1)],'b-o','LineWidth',2);
scatter(Ax(1,:),Ax(2,:),'r');
plot([0,Ax(1,1)],[0,Ax(2,1)],'r-o','LineWidth',2);
hold off; grid on; axis equal; title('a = 0.9');


a = 0.99;
A=[1 a; a 1]; %Diagonal or any matrix
Ax=A*x;

figure; hold on;
scatter(x(1,:),x(2,:),'b');
plot([0,x(1,1)],[0,x(2,1)],'b-o','LineWidth',2);
scatter(Ax(1,:),Ax(2,:),'r');
plot([0,Ax(1,1)],[0,Ax(2,1)],'r-o','LineWidth',2);
hold off; grid on; axis equal; title('a = 0.99');


a = 0.999;
A=[1 a; a 1]; %Diagonal or any matrix
Ax=A*x;

figure; hold on;
scatter(x(1,:),x(2,:),'b');
plot([0,x(1,1)],[0,x(2,1)],'b-o','LineWidth',2);
scatter(Ax(1,:),Ax(2,:),'r');
plot([0,Ax(1,1)],[0,Ax(2,1)],'r-o','LineWidth',2);
hold off; grid on; axis equal; title('a = 0.999');


a = - 0.9;
A=[1 a; a 1]; %Diagonal or any matrix
Ax=A*x;

figure; hold on;
scatter(x(1,:),x(2,:),'b');
plot([0,x(1,1)],[0,x(2,1)],'b-o','LineWidth',2);
scatter(Ax(1,:),Ax(2,:),'r');
plot([0,Ax(1,1)],[0,Ax(2,1)],'r-o','LineWidth',2);
hold off; grid on; axis equal; title('a = - 0.9'); 