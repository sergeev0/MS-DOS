; ...existing code...
; Add new command to COMTAB
COMTAB  DB      4,"DIR",1
        DW      OFFSET TRANGROUP:CATALOG
        DB      7,"RENAME",1
        DW      OFFSET TRANGROUP:RENAME
        DB      4,"REN",1
        DW      OFFSET TRANGROUP:RENAME
        DB      6,"ERASE",1
        DW      OFFSET TRANGROUP:ERASE
        DB      4,"DEL",1
        DW      OFFSET TRANGROUP:ERASE
        DB      5,"TYPE",1
        DW      OFFSET TRANGROUP:TYPEFIL
        DB      4,"REM",1
        DW      OFFSET TRANGROUP:COMMAND
        DB      5,"COPY",1
        DW      OFFSET TRANGROUP:COPY
        DB      6,"PAUSE",1
        DW      OFFSET TRANGROUP:PAUSE
        DB      3,"GPT",1
        DW      OFFSET TRANGROUP:GPTCMD
        DB      5,"DATE",0
        DW      OFFSET TRANGROUP:DATE
        DB      5,"TIME",0
        DW      OFFSET TRANGROUP:TIME
        DB      0               ;Terminate command table

; ...existing code...
; Add the GPT command handler
GPTMSG  DB      'gpt-4.1 was there',13,10,'$'
GPTCMD:
        MOV     DX,OFFSET TRANGROUP:GPTMSG
        MOV     AH,PRINTBUF
        INT     33
        RET
; ...existing code...
