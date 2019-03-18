function [w,At,bt]=LSTD(P,R,N,A,Phi,k,Dmat,gamma,At,bt,rt,pol)

for i=2:length(Dmat)
	s=Dmat(i,1);
	a=Dmat(i,2);
	snew=Dmat(i,3);
	anew=pol(snew);
	ind=(a-1)*N+s;
	indnew=(anew-1)*N+snew;
	rt=R(s);
	At=At+Phi(ind,:)'*( Phi(ind,:)-gamma*Phi(indnew,:) );
	bt=bt+Phi(ind,:)'*rt;
%	w=inv(At+0.00*eye(size(At)))*bt;
end;
	w=inv(At+0.00*eye(size(At)))*bt;

