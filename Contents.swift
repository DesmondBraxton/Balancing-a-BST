import UIKit

// Balancing a binary tree

class TreeNode {
     var val: Int
     var left: TreeNode?
     var right: TreeNode?
    
     init() { self.val = 0; self.left = nil; self.right = nil; }
      public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        
          self.val = val
          self.left = left
          self.right = right
   }
}
 

     func balanceBST(_ root: TreeNode?) -> TreeNode? {
        if root == nil { return nil }
        
        var results = [TreeNode]()
        inorderTraversal(root, &results)
        return build(results, 0, results.count - 1)
    }
    
    private func inorderTraversal(_ root: TreeNode?, _ results: inout [TreeNode]) {

        if root == nil { return }
        
        inorderTraversal(root?.left, &results)
        results.append(root!)
        inorderTraversal(root?.right, &results)
        
    }


private func build(_ results: [TreeNode], _ start: Int, _ end: Int) -> TreeNode? {
    if start > end { return nil }
    
    let mid = start + (end-start)/2
    var midNode = results[mid]
    
    midNode.left = build(results, start, mid-1)
    midNode.right = build(results, mid + 1, end)
    
    return midNode
  }

