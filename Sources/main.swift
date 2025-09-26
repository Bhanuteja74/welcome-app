import Cocoa

class AppDelegate: NSObject, NSApplicationDelegate {
    let statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
    
    override init() {
        super.init()
        setupMenu()
    }
    
    func setupMenu() {
        if let button = statusItem.button {
            button.title = "👋"
        }

        let menu = NSMenu()
        menu.addItem(NSMenuItem(title: "Say Hello", action: #selector(sayHello), keyEquivalent: "h"))
        menu.addItem(NSMenuItem.separator())
        menu.addItem(NSMenuItem(title: "Quit", action: #selector(NSApplication.terminate), keyEquivalent: "q"))
        statusItem.menu = menu
    }

    @objc func sayHello() {
        let alert = NSAlert()
        alert.messageText = "Welcome!"
        alert.informativeText = "You clicked Hello from the menu bar 🚀"
        alert.runModal()
    }
}

// Start the app
let app = NSApplication.shared
app.setActivationPolicy(.accessory)

let delegate = AppDelegate()
app.delegate = delegate // ✅ Now works
app.run()
