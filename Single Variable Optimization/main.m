filename = 'C:\Users\Anupam Khandelwal\Documents\inputdata.xlsx';
%Filepath needs to be specified accordingly to the user's PC.

I = xlsread(filename);

%'I' represents the input parameters array by the user.Each row corresponds to data of a problem statement.
%First column of I represents the lower bound of search interval of i-th problem statement.
%Second column of I represents the upper bound of search interval of i-th problem statement.
%Third column represents number of divisions of search interval of i-th problem statement.
%Fourth column represents the fractional increment(delta) required to compute the derivative of function.
%Fifth column represents the epsilon value required to define accuracy and termination condition.

%There are total 10 problem statements so 'I' is a 10*5 matrix. 

for i = 1:10
    
    a = I(i,1);
    b = I(i,2);
    n = I(i,3);
    delta_x = I(i,4);
    epsilon = I(i,5);
    
    function_name = strcat('f',num2str(i));
    X = exhaustive_search(a,b,n,function_name);                                 %Exhaustive Search call.
        
    if X(1)==1                                                  
        
        %Successful exhaustive search call. 
        
        minima = bisection_search(X(2),X(3),delta_x,epsilon,function_name);     %Bisection Search call.
        disp(i);
        disp(minima);
        
    else
        
        %Unsuccessful exhaustive search call implying function being monotonic in the search interval.
        
        if feval(function_name,a) <= feval(function_name,b)
            
            minima = a;      %Monotonically increasing function.
            disp(i);
            disp(minima);
            
        else
            
            minima = b;      %Monotonically decreasing function.
            disp(i);
            disp(minima);
            
        end
        
    end
    
    if X(1)==0
        
        %Single plot if function is monotonic in search interval.
        
        x_plot = a:(b-a)/10000000:b;
        y_plot = feval(function_name,x_plot);
        txt1 = strcat('(',num2str(minima),num2str(feval(function_name,minima)),')');
        figure(i)
        plot(x_plot,y_plot,'b--',minima,feval(function_name,minima),'r*');
        text(minima,feval(function_name,minima),txt1,'FontSize',8);
        title('Normal plot with red * representing minima.','FontSize',8);
        
    else
        
        %Double plot if function has a minima in search interval.
        %First plot shows the function in search interval with minima point.
        %Second plot is magnified image at minima pont with bracketed interval marked with solid line.
        
        x_brac = X(2):(X(3)-X(2))/10000000:X(3);
        y_brac = feval(function_name,x_brac);
        
        x_plot = a:(b-a)/10000000:b;
        y_plot = feval(function_name,x_plot);
        
        txt1 = strcat('(',num2str(X(2)),',',num2str(feval(function_name,X(2))),')  ');
        txt2 = strcat('(',num2str(X(3)),',',num2str(feval(function_name,X(3))),')  ');
        txt3 = strcat('(',num2str(minima),num2str(feval(function_name,minima)),')');
        
        figure(i)
        subplot(1,2,1);
        plot(x_plot,y_plot,'b--',minima,feval(function_name,minima),'r*');
        text(minima,feval(function_name,minima),txt1,'FontSize',8);
        title('Normal plot with red * representing minima.','FontSize',8);
        
        subplot(1,2,2);
        plot(x_plot,y_plot,'b--',x_brac,y_brac,'k',minima,feval(function_name,minima),'r*',X(2),feval(function_name,X(2)),'k.',X(3),feval(function_name,X(3)),'k.');
        axis([X(2)-0.01 X(3)+0.01 feval(function_name,minima)-0.0001 feval(function_name,X(2))+0.002]);
        text(X(2),feval(function_name,X(2)),txt1,'HorizontalAlignment','right','FontSize',8);
        text(X(3),feval(function_name,X(3)),txt2,'FontSize',8);
        title('Magnified plot near minima with black solid line representing bracketed interval.','FontSize',8);        
    
    end
    
    clear(function_name)

end

disp('end');

    
