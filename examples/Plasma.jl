function plasma()
    pallete = zeros(UInt32, 512)
    WIDTH = 320
    HEIGHT = 240
    inc = 90 / 64;
    for c in 1:64
        col = round(Int, ((255 * sin( (c-1) * inc * π / 180)) + 0.5));
        pallete[64*0 + c] = mfb_rgb(col,     0,       0);
        pallete[64*1 + c] = mfb_rgb(255,     col,     0);
        pallete[64*2 + c] = mfb_rgb(255-col, 255,     0);
        pallete[64*3 + c] = mfb_rgb(0,       255,     col);
        pallete[64*4 + c] = mfb_rgb(0,       255-col, 255);
        pallete[64*5 + c] = mfb_rgb(col,     0,       255);
        pallete[64*6 + c] = mfb_rgb(255,     0,       255-col);
        pallete[64*7 + c] = mfb_rgb(255-col, 0,       0);
    end
    window = mfb_open_ex("Plasma Test", WIDTH, HEIGHT, MiniFB.WF_RESIZABLE);
    g_buffer = zeros(UInt32, WIDTH * HEIGHT)
    mfb_set_target_fps(10);
    time=0
    while mfb_wait_sync(window)
        time_x = sin(time * π / 180);
        time_y = cos(time * π / 180);
        i = 1;
        for y in 1:HEIGHT
            dy = cos((y * time_y) * π / 180); 
            for x in 1:WIDTH
                dx = sin((x * time_x) * π / 180); 
                idx = round(Int, ((2 + dx + dy) * 0.25 * 511) + 1)
                g_buffer[i] = pallete[idx];
                i += 1
            end
        end
        time += 1
        state = mfb_update(window, g_buffer);
        if state != MiniFB.STATE_OK
            break;
        end
    end
    mfb_close(window)
end