if (get_window_role() == "desktop-term") then
   set_window_geometry(88,24,1536,1024);
   undecorate_window();
   set_skip_pager(true);
   set_skip_tasklist(true);
   set_window_type("WINDOW_TYPE_DESKTOP");
   set_window_below();
   pin_window();
   stick_window();
end
