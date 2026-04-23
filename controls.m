global key
InitKeyboard();

gear = 1;
while 1
    pause(0.1);
    touch = brick.TouchPressed(1);
    touch2 = brick.TouchPressed(2);
    if touch || touch2
        brick.playTone(100, 15000, 40);
        brick.playTone(100, 15000, 40);
    end
    switch key
        case 'm'
            disp('gear up');
            if (gear < 4)
                gear = gear + 1;
            end
        case 'n'
            disp('gear down');
            if (gear > 0)
                gear = gear - 1;
            end
        case 'uparrow'
            disp('up');
            brick.MoveMotor('AB', (gear * -33));
            %pause(0.1);
            %brick.MoveMotor('AB', 0);
        case 'downarrow'
            disp('down');
            brick.MoveMotor('AB', 33);
            brick.playTone(100, 2000, 90);
            %pause(0.1);
            %brick.MoveMotor('AB', 0);
        case 'leftarrow'
            disp ('left');
            brick.MoveMotor('A', 100);
            brick.MoveMotor('B', -100);
            %pause(0.1);
            %brick.MoveMotor('AD', 0);
        case 'rightarrow'
            disp('right');
            brick.MoveMotor('A', -100);
            brick.MoveMotor('B', 100);
            %pause(0.1);
            %brick.MoveMotor('CB', 0);
        case 'k'
            disp('k')
            brick.MoveMotor('C', -100);
        case 'l'
            disp('l')
            brick.MoveMotor('C', 100);
        case 'space'
            disp('space pressed');
            brick.MoveMotor('ABC', 0);
        case 0
            disp('no key pressed');
            brick.MoveMotor('AB', 0);
        case 'p'
            disp('auto mode')
            distance = brick.UltrasonicDist(4);
            display(distance);
            brick.SetColorMode(3, 2);
            color = brick.ColorCode(3);
            display(color); 
            while (color ~= 3)
                brick.MoveMotor('AB', -50);
                distance = brick.UltrasonicDist(4);
                display(distance);
                color = brick.ColorCode(3);
                display(color);
                touch = brick.TouchPressed(1);
                touch2 = brick.TouchPressed(2);
                if touch || touch2
                    disp('touch')
                    pause(0.5);
                    brick.MoveMotor('AB', 50);
                    pause(1);
                    brick.MoveMotor('AB', 0);
                    pause(0.5);
                    brick.MoveMotor('A', 50);
                    brick.MoveMotor('B', -50);
                    pause(0.25);
                    brick.MoveMotor('AB', 0);
                    pause(0.5);
                end
            end
        case 'q'
            break;
    end
end
CloseKeyboard();