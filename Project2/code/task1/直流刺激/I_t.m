for i = 1:1:s-1
    for j = 1:2:9
        if(t(i)>=100*(j-1) & t(i)<=100*j)
            I(i) = 10*(j+1);
        elseif(t(i)>=100*j & t(i)<=100*(j+1))
            I(i) = 0;    
        end
    end
end
I(s) = I(s-1);
plot(t,I)
xlabel('t');ylabel('I(t)');
title('I-t');