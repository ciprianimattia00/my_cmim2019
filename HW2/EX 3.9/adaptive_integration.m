% Function that works computing values of integral for 'n' interval and
% '2n'intervals, comparing the difference between these two with a given
% tolerance epsilon. It is characterized by a loop that stops when 
% abs(integral_2 - integral_1) < epsilon(j), returning the value of '2n'
% and the difference between the two integrals. It work with both
% trapezoidal and midpoint methode. The function can work if epsilon is a
% vector, giving in output a vector of n_values

function [n_values] = adaptive_integration (f, a, b, epsilon, method)

    N = length(epsilon);
    n_values = []; % vector containing all the n value
    j = 1; % for starter
    
for j = 1 : N  % loop for cecking all the epsilon value and obtaining a value of n for every epsilon

      condition = false; % while starter
      
      n = zeros(1,N) + 1; 
     
  while condition == false

      if strcmp('trapezoidal', method) % if for comparing strings
    
          integral_1 = trapezoidal(f, a, b, n(j));
    
          integral_2 = trapezoidal(f, a, b, 2*n(j));
    
      elseif strcmp('midpoint', method) % elseif for comparing strings
      
          integral_1 = midpoint_vec(f, a, b, n(j));
    
          integral_2 = midpoint_vec(f, a, b, 2*n(j));
        
      end
  

      if abs(integral_2 - integral_1) < epsilon(j)
        
          fprintf('error between integrals = ');
        
          disp(abs(integral_2 - integral_1));

          x = 2*n(j); % return 2n
        
          fprintf('2*n = ');
        
          disp(x);
        
          n_values(end + 1) = x; % save n(j) in an array
        
          condition = true; % stop the loop 

          break;

      else
        
           n(j) = 2*n(j); % restat the cycle with a doubled n      

      end % if
    
  end %while
  
  j = j + 1; % restart the for cycle increasing the positon in the epsilon array by 1


end %for

end