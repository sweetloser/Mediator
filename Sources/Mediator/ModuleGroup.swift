/*
 * @Author: sweetloser 
 * @Date: 2025-03-14 15:28:03 
 * @Last Modified by: sweetloser
 * @Last Modified time: 2025-03-14 15:52:45
 */

public struct ModuleGroup {
    var identifier: String
    var modules: [Module]
    var completion: (() -> Void)?

    public init(identifier: String, modules: [Module]) {
        self.identifier = identifier
        self.modules = modules
    }

    func handle(request: Request, completion: @escaping (() -> Void)? = nil) {
        self.completion = completion
        process(request: request)
    }

    func process(request: Request) {
        guard let module = modules.first else {
            completion?()
            return
        }
        modules.removeFirst()
        module.handle(request: request, next: { [weak self] request in
            self?.process(request: request)
        })
    }
}