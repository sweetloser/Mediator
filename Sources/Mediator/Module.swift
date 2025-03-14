/*
 * @Author: sweetloser 
 * @Date: 2025-03-14 14:39:13 
 * @Last Modified by: sweetloser
 * @Last Modified time: 2025-03-14 16:02:51
 */

protocol Module {
    var identifier: String { get }
    func process(request: Request?, next: @escaping ((Request) -> Void)?)
}