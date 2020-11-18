% Aysia Demby NE 423 HW 4

%% Question 2
clear

%First, I input the needed variables, and find the values l.
lengths = [50.851, 50.902, 50.952, 51.003, 51.054, 51.311,51.816, 52.823, ...
    53.848, 54.864, 55.88, 56.896, 57.658, 58.42, 59.182];
load = [7330, 15100, 23100, 30400, 34400, 38400, 41300, 44800, 46200,...
    47300, 47500, 46100, 44800, 42600, 36400];
L0 = 50.8;
difference= lengths - L0*ones(1, length(lengths));
d = 12.8;
r = d/2;
A0 = pi*r^2;

%Solving for stress and strain
stress = load./A0; 
strain = (difference/L0)*100;

%plotting both.
plot(strain, stress, 'go', strain, stress, 'b-','LineWidth', 3 );
xlabel('Strain \epsilon (%)');
ylabel('Stress \sigma (MPa)');
title('Engineering Stress vs. Engineering Strain');
xline(strain(1,11),'--', 'LineWidth', 2);
yline(stress(1,11), '--', 'LineWidth', 2);

%Now want to find the modulus of elasticity, I am using the first two
%points because any others happen at values greater than .2 percent, which
%is where we expect yield stress to occur.

fractional=strain(1,1:2)/100;
young=stress(1,1:2)./fractional;
%average method
YMA=mean(young)
%slope method
elstress=stress(1, 1:2);
YMS=polyfit(fractional,elstress,1)

