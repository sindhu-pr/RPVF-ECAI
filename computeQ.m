function [Q,V,pol]=computeQ(Phi,w,N,A)
Q=reshape(Phi*w,N,A);
V=max(Q')';
for i=1:N
pol(i)=min(find(Q(i,:)==V(i)));
end;





