
% A(alpha)x = b; find b 
% original vector: [0,0] to x 
x = [0; 1];

figure; hold on;

% visualization of the effect of alpha  

for alpha=(-pi):0.1:2*pi

    A_1 = [cos(alpha) -sin(alpha); sin(alpha) cos(alpha)];
    
    b_1 = A_1 * x;
    
    plot([0,x(1)],[0,x(2)],"r-o","LineWidth",2);
    plot([0, b_1(1)], [0, b_1(2)], 'b-', 'LineWidth', 2);
    
    hold off; grid on; axis equal; xlim([-1, 1]); ylim([-1, 1]);

    pause(0.01)
end

alpha_45_agclock = 45
A = [cosd(alpha_45_agclock) -sind(alpha_45_agclock);sind(alpha_45_agclock) cosd(alpha_45_agclock)];
x_45_agclock = A * x

alpha_60_agclock = 60
A_2 = [cosd(alpha_60_agclock) -sind(alpha_60_agclock);sind(alpha_60_agclock) cosd(alpha_60_agclock)];
x_60_agclock = A_2 * x

alpha_45_clock = 45
A_3 = [cosd(alpha_45_clock) sind(alpha_45_clock);-sind(alpha_45_clock) cosd(alpha_45_clock)];
x_45_clock = A_3 * x

alpha_60_clock = 60
A_4 = [cosd(alpha_60_clock) sind(alpha_60_clock);-sind(alpha_60_clock) cosd(alpha_60_clock)];
x_60_clock = A_4 * x


figure; hold on;

plot([0, x(1)],[0, x(2)], "r-o","LineWidth",2)

plot([0, x_45_agclock(1)],[0, x_45_agclock(2)], "b-o","LineWidth",2)
plot([0, x_60_agclock(1)],[0, x_60_agclock(2)], "y-o","LineWidth",2)

plot([0, x_45_clock(1)],[0, x_45_clock(2)], "b-o","LineWidth",2)
plot([0, x_60_clock(1)],[0, x_60_clock(2)], "y-o","LineWidth",2)


hold off; grid on; axis equal; xlim([-1, 1]); ylim([-1, 1]);




