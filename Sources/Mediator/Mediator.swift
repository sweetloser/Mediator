/*
 * @Author: sweetloser 
 * @Date: 2025-03-14 14:51:37 
 * @Last Modified by: sweetloser
 * @Last Modified time: 2025-03-14 15:55:47
 */

import Foundation

public class Mediator {
    private var moduleGroups: [ModuleGroup] = []

    public func addModuleGroup(_ moduleGroup: ModuleGroup) {
        moduleGroups.append(moduleGroup)
    }
    public func handle(request: Request, identifier: String) {
        guard let moduleGroup = moduleGroups.first(where: { $0.identifier == identifier }) else {
            return
        }
        moduleGroup.handle(request: request, completion: { [weak self] in
            self?.moduleGroups.removeAll(where: { $0.identifier == identifier })
        })
    }
    
}