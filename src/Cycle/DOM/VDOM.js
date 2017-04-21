var h = require('@cycle/dom').h;

// export declare function h(
//   sel: string,
//   data: VNodeData,
//   children: Array<VNode>
// ): VNode;
exports.h = function (sel) {
  return function (data) {
    return function (children) {
      return h(sel, data, children)
    };
  };
};