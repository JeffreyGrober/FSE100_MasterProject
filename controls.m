global key
InitKeyboard();

while 1
    pause(0.02);
    switch key
        case 'uparrow'
            disp('up');
            brick.MoveMotor('AB', -100);
            pause(0.1);
            brick.MoveMotor('AB', 0);
        case 'downarrow'
            disp('down');
            brick.MoveMotor('AB', 100);
            pause(0.1);
            brick.MoveMotor('AB', 0);
        case 'leftarrow'
            disp ('left');
            brick.MoveMotor('AD', 100);
            pause(0.1);
            brick.MoveMotor('AD', 0);
        case 'rightarrow'
            disp('right');
            brick.MoveMotor('CB', 100);
            pause(0.1);
            brick.MoveMotor('CB', 0);
        case 0
            disp('no key pressed');
        case 'q'
            break;
    end
end
CloseKeyboard();