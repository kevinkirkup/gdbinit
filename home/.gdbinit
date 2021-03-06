# GDB settings for X-Code
#set start-with-shell 0

# Source the defualt GDB init
source ~/.gdb/reverseEngineer.gdbinit

set disassembly-flavor att

set print asm-demangle on
set print demangle on
context-off

define ctx
    context
    end
document ctx
    Alias to the context list
end

#define po
#    set $_PREV_CONTEXT_STATUS = $SHOW_CONTEXT
#    set $SHOW_CONTEXT = 0
#    print-object $arg0 $arg1 $arg
#   set $SHOW_CONTEXT = $_PREV_CONTEXT_STATUS
#end
#
