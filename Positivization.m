

function [posit_x] = Positivization(x,type,i)

    if type == 1  
        posit_x = Min2Max(x);  
        disp([ num2str(i) 'processing completed'] )
        disp('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~')
    else
        disp('sorry')
    end
end


