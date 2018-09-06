import keyboard

keyboard.on_release_key(100, lambda e: keyboard.call_later(keyboard.send, args=['alt+space']))

keyboard.wait()
