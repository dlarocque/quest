#![no_std]
#![no_main]

use core::panic::PanicInfo;

#[panic_handler]
fn panic(_info: &PanicInfo) -> ! {
    loop {}
}

/// This function defines the entry point for the binary.
/// The entrypoint for most Rust programs is C run-time 0 (crt0),
/// which then invokes the entry point of the Rust runtime, which 
/// is marked by the `start` lang_item. Since we don't have access
/// to the `start` lang_item, we must define our own entry point that
/// overwrites the crt0 entry point.
#[no_mangle] // Do not mangle the function name, we need it to be _start
pub extern "C" fn _start() -> ! {
    loop{} // Diverge, since this is the entry point
}
