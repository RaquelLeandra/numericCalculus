function F = System(x)

global C;

F = [C*cos(x(1))*(8*sin(x(1))+3*sin(x(2)))-9*sin(x(1))
     C*cos(x(2))*(3*sin(x(1))+2*sin(x(2)))-3*sin(x(2))
    ];

end