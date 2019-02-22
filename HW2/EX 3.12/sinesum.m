% sinesum(t, b) that returns SN(t), where SN(t) is a summation of sine 
%functions for approximazaing a sound wave, given the coefficients bn in an 
% array b and time coordinates in an array t. Note that if t is an array,
% the return value is also an array.


function SN = sinesum(b, t)

M = length(t);
N = length(b);

% The following step define an array, or a matrix 1xM, for starting the
% double for loop, used to calculate the summation of sines function. "i"
% is referring to the position in the array t, "j" is referring to the
% position in the arrey b.

SN = zeros(1, M);

for i = 1 : M
    
    for j = 1 : N
        
        SN(i) = SN(i) + b(j) * sin(j * t(i)); % Summation line 
        
    end
    
end

% if M == 1
%      SN = SN(1);
% end

%disp(SN); % it is commented becouse running auto_trial function with
           % M = 500 it displays an array of 500 numbers

end
