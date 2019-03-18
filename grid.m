function []=grid(A,P,R,N,Diag,Adj,expW,k,Dmat,gamma,pol,fname,flag)
%fname
fptr=fopen(fname,'w');
if (flag==0)
[V,D]=eig(inv(Diag)*Adj);
else
[V,D]=eig(inv(Diag)*expW);
end
[Phi]=createbasis(V,D,A,k);
for i=1:N
    [x,y]=computexy(i,xsize);
    pp(x,y)=V(i,3);
end
    
%setting a random policy
%Initializing the various matrices
i=1;
s=Dmat(i,1);
a=Dmat(i,2);
snew=Dmat(i,3);
anew=pol(snew);
ind=(a-1)*N+s;
indnew=(anew-1)*N+snew;
rt=R(s);
At=Phi(ind,:)'*(Phi(ind,:)-gamma*Phi(indnew,:));
bt=Phi(ind,:)'*rt;
Pol=zeros(N,N);
for i=1:20
[w,At,bt]=LSTD(P,R,N,A,Phi,k,Dmat,gamma,At,bt,rt,pol);
[Q,V,pol]=computeQ(Phi,w,N,A);
	for j=1:N
	Ppol(j,:)=P(j,:,pol(j));
	end;
	Vpol=inv(eye(N)-gamma*Ppol)*R;
	%for j=1:N
	fprintf(fptr,'%f  ',Vpol');
    fprintf(fptr,'\n',Vpol');
	%end;
%steps=execpol(pol,R,xsize,ysize)
end

fclose(fptr);

    

