function [fitresult, gof] = createFit(T, C)
%CREATEFIT(T,C)
%  Create a fit.
%
%  Data for 'Heat Capacity' fit:
%      X Input : T
%      Y Output: C
%  Output:
%      fitresult : a fit object representing the fit.
%      gof : structure with goodness-of fit info.
%
%  See also FIT, CFIT, SFIT.

%  Auto-generated by MATLAB on 21-Mar-2018 20:46:19


%% Fit: 'Heat Capacity'.
[xData, yData] = prepareCurveData( T, C );

% Set up fittype and options.
ft = fittype( 'b*T^3 + ((0.5036*g/T)^2)*exp(0.5036*g/T)/(1+exp(0.5036*g/T))^2', 'independent', 'T', 'dependent', 'C' );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
opts.StartPoint = [0.810633455615081 0.8002804688888];

% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft, opts );

% Plot fit with data.
figure( 'Name', 'Heat Capacity' );
h = plot( fitresult, xData, yData );
legend( h, 'C vs. T', 'Heat Capacity', 'Location', 'NorthEast' );
% Label axes
xlabel T
ylabel C
grid on

