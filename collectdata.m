function[Dmat]=collectdata(x0,p,v,action,nEpisode)

    iter=1;
    %%while(iter<=nEpisode && p<.5)
        while(p<.5)
        u=action(randi(3));               %% Choose action
        [pNext,vNext] = mountain(p,v,u);  %% Call the mountain car function
        unew=action(randi(3));            %% Choose new action
        Dmat(iter,:)=[[p,v] u [pNext,vNext] unew];  %% Store the value for RPI
        p=pNext;                            
        v=vNext;
        u=unew;
        iter=iter+1;
        if(iter>10000 )
            p=x0(1);
            v=x0(2);
            iter=1;
            Dmat=[];
        end
     end


