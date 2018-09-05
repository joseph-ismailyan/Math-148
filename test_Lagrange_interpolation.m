% Joseph Ismailyan, 1558715

function  [x,f,P1,P2,P3,P4] = test_Lagrange_interpolation()
% 
% x:  vector  of  1000  evenly-spaced  nodes  in  [-1,1] (use  the  command
% x = linspace(-1,1,1000)).
% 
% f: vector  representing  (1)  evaluated  at x.
% 
% P1: Lagrange  polynomial  for  (1)  built  on  the  grid  (2)  with
% N = 8  nodes  and  evaluated  at x.
% 
% P2:  Lagrange  polynomial  for  (1)  built  on  the  grid  (2)  with
% N =  20  nodes  and  evaluated  at x.
% 
% P3: Lagrange  polynomial  for  (1)  built  on  the  grid  (3)  with
% N = 8  nodes  and  evaluated  at x.
% 
% P4: Lagrange  polynomial  for  (1)  built  on  the  grid  (3)  with
% N = 20  nodes  and  evaluated  at x.
%
% You may also uncomment P3 in each block to see the relative error
% graphed.
%


% define function
f = @(x) 1/(1+20*x^2);
x = linspace(-1,1,1000);
xi = [];
yi = [];
P1 = [];
P2 = [];
P3 = [];
P4 = [];
% Qn hold the results until the very end, then 
% pass them to the respective Pn
Q1 = [];
Q2 = [];
Q3 = [];
Q4 = [];
N = 0;
% construct lagrange polynomial for N = 8 nodes
% that are equally spaced
% ---------------N = 8, evenly spaced---------------------
N = 8;
% populate xi and yi
for k=1:N
    xi(k) = -1+2*((k-1)/N);
    yi(k) = f(xi(k));
end

% interpolate using xi and yi
for j=1:length(x)
        P1(j) = Lagrange_interp(xi,yi,x(j));
        P2(j) = f(x(j));
%         P3(j) = abs((P2(j)-P1(j))/P2(j))*100;
%         fprintf("Error %d = %f\n", j, P3(j));
end
Q1 = P1;

plot(x,P1,'r',x,P2,'b');
title("P1: N = 8, evenly spaced");
lgd = legend('Lagrangian','f(x)');
lgd.Location = 'southwest';
figure();
% plot(x,P3,'g');
% title("relative error, N = 8, evenly spaced");
% figure();

% % ------------------------------------------------------

% ---------------N = 20, evenly spaced---------------------
N = 20;
% populate xi and yi
for k=1:N
    xi(k) = -1+2*((k-1)/N);
    yi(k) = f(xi(k));
end

% interpolate using xi and yi
for j=1:length(x)
        P1(j) = Lagrange_interp(xi,yi,x(j));
        P2(j) = f(x(j));
%         P3(j) = abs((P2(j)-P1(j))/P2(j))*100;
%         fprintf("Error %d = %f\n", j, P3(j));
end

Q2 = P1;

plot(x,P1,'r',x,P2,'b');
title("P2: N = 20, evenly spaced");
lgd = legend('Lagrangian','f(x)');
lgd.Location = 'southwest';

figure();
% plot(x,P3,'g');
% title("relative error, N = 20, evenly spaced");
% figure();

% % ------------------------------------------------------

% ---------------N = 8, unevenly spaced---------------------
% populate xi and yi
N = 8;
for k=1:N
    xi(k) = cos((pi/N)*(k-1));
    yi(k) = f(xi(k));
end

% interpolate using xi and yi
for j=1:length(x)
        P1(j) = Lagrange_interp(xi,yi,x(j));
        P2(j) = f(x(j));
%         P3(j) = abs((P2(j)-P1(j))/P2(j))*100;
%         fprintf("Error %d = %f\n", j, P3(j));
end

Q3 = P1;

plot(x,P1,'r',x,P2,'b');
title("P3: N = 8, unevenly spaced");
legend('Lagrangian','f(x)');
figure();
% plot(x,P3,'g');
% title("relative error, N = 8, unevenly spaced");
% figure();

% % ------------------------------------------------------

% ---------------N = 20, unevenly spaced---------------------
% populate xi and yi
N = 20;
for k=1:N
    xi(k) = cos((pi/N)*(k-1));
    yi(k) = f(xi(k));
end

% interpolate using xi and yi
for j=1:length(x)
        P1(j) = Lagrange_interp(xi,yi,x(j));
        P2(j) = f(x(j));
%         P3(j) = abs((P2(j)-P1(j))/P2(j))*100;
%         fprintf("Error %d = %f\n", j, P3(j));
end

Q4 = P1;

plot(x,P1,'r',x,P2,'b');
title("P4: N = 20, unevenly spaced");
legend('Lagrangian','f(x)');

%figure();
% plot(x,P3,'g');
% title("relative error, N = 20, unevenly spaced");
% figure();

% % ------------------------------------------------------

P1 = Q1;
P2 = Q2;
P3 = Q3;
P4 = Q4;

end

