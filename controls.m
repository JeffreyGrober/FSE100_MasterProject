global key
InitKeyboard();

gear = 1;
while 1
    pause(0.1);
    touch = brick.TouchPressed(1);
    touch2 = brick.TouchPressed(2);
    if touch || touch2
        brick.playTone(100, 15000, 90);
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
            brick.MoveMotor('AD', 100);
            brick.MoveMotor('CB', -100);
            %pause(0.1);
            %brick.MoveMotor('AD', 0);
        case 'rightarrow'
            disp('right');
            brick.MoveMotor('AD', -100);
            brick.MoveMotor('CB', 100);
            %pause(0.1);
            %brick.MoveMotor('CB', 0);
        case 'space'
            disp('space pressed');
            brick.MoveMotor('ABCD', 0);
        case 0
            disp('no key pressed');
            brick.MoveMotor('ABCD', 0);
        case 'q'
            break;
    end
end
CloseKeyboard();