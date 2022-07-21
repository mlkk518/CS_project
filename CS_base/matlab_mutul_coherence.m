function u = mutual_coherence(A)
% computes the mutual coherence a matrix
% Input:  a real or complex matrix with more than one column
% Ouput:  the mutual coherence
%
% Written by Dr. Yoash Levron, Technion, Israel, 2015

[M N] = size(A);
if (N<2)
    disp('error - input contains only one column');
    u=NaN;   beep;    return    
end

% normalize the columns
nn = sqrt(sum(A.*conj(A),1));
if ~all(nn)
    disp('error - input contains a zero column');
    u=NaN;   beep;    return
end
nA = bsxfun(@rdivide,A,nn);  % nA is a matrix with normalized columns

u = max(max(triu(abs((nA')*nA),1)));

end


%%% -------------------example -------------------%%%%%
                      
                      % this script demonstrates the function 'mutual_coherence'
% Written by Dr. Yoash Levron, Technion, Israel, 2015

clc;

% first example:
M=20;  N = 500;
A = 10*randn(M,N) + 10i*randn(M,N);
u = mutual_coherence(A)
lower_bound_on_mutual_coherence = ((N-M)/(M*(N-1)))^0.5

% second example:
M=2;  N = 4;
A = randn(M,N);
u = mutual_coherence(A)
lower_bound_on_mutual_coherence_for_2D_columns = cos(pi/N)

% Plot the normalized columns of A (for the second example):
B = bsxfun(@rdivide,A,sqrt(sum(A.*conj(A),1))); % normalize the columns
plot(B(1,:),B(2,:),'kx','linewidth',7);
xlim([-1 1]); ylim([-1 1]);
title('normalized columns of A');






