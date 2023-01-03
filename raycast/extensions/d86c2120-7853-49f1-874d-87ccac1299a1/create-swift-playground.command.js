"use strict";var B=Object.create;var w=Object.defineProperty;var q=Object.getOwnPropertyDescriptor;var G=Object.getOwnPropertyNames;var J=Object.getPrototypeOf,Q=Object.prototype.hasOwnProperty;var k=(o,e)=>()=>(e||o((e={exports:{}}).exports,e),e.exports),Y=(o,e)=>{for(var n in e)w(o,n,{get:e[n],enumerable:!0})},A=(o,e,n,t)=>{if(e&&typeof e=="object"||typeof e=="function")for(let i of G(e))!Q.call(o,i)&&i!==n&&w(o,i,{get:()=>e[i],enumerable:!(t=q(e,i))||t.enumerable});return o};var m=(o,e,n)=>(n=o!=null?B(J(o)):{},A(e||!o||!o.__esModule?w(n,"default",{value:o,enumerable:!0}):n,o)),Z=o=>A(w({},"__esModule",{value:!0}),o);var E=k((se,v)=>{"use strict";function _(o){var e=void 0;typeof o=="string"?e=[o]:e=o.raw;for(var n="",t=0;t<e.length;t++)n+=e[t].replace(/\\\n[ \t]*/g,"").replace(/\\`/g,"`"),t<(arguments.length<=1?0:arguments.length-1)&&(n+=arguments.length<=t+1?void 0:arguments[t+1]);var i=n.split(`
`),r=null;return i.forEach(function(s){var f=s.match(/^(\s+)\S+/);if(f){var g=f[1].length;r?r=Math.min(r,g):r=g}}),r!==null&&(n=i.map(function(s){return s[0]===" "?s.slice(r):s}).join(`
`)),n=n.trim(),n.replace(/\\n/g,`
`)}typeof v<"u"&&(v.exports=_)});var $=k((de,V)=>{"use strict";var ee=require("os"),O=ee.homedir();V.exports=o=>{if(typeof o!="string")throw new TypeError(`Expected a string, got ${typeof o}`);return O?o.replace(/^~(?=$|\/|\\)/,O):o}});var re={};Y(re,{default:()=>te});module.exports=Z(re);var a=require("@raycast/api");var S=(t=>(t.iOS="ios",t.macOS="macos",t.tvOS="tvos",t))(S||{});var D=require("child_process"),U=require("util"),x=(0,U.promisify)(D.exec);var N=m(E());var h=(t=>(t.Empty="Empty",t.SwiftUI="SwiftUI",t.UIKit="UIKit",t))(h||{});var c=m(require("fs")),F=o=>c.default.promises.access(o,c.default.constants.F_OK).then(()=>!0).catch(()=>!1),ce=c.default.promises.readdir,T=c.default.promises.mkdir,I=c.default.promises.rm,me=c.default.promises.readFile,L=c.default.promises.writeFile,ue=c.default.promises.rm;var R=m($()),P=m(require("path"));var X=require("@raycast/api");function j(){return(0,X.getPreferenceValues)()}var u=class{static get defaultSwiftPlaygroundLocation(){return j().playgroundDefaultLocation}static async createSwiftPlayground(e,n){let t=await u.makeSwiftPlaygroundPath(e.location,e.name,n);if(!n&&await F(t))return{name:e.name,path:t,alreadyExists:!0,open:()=>x(`open ${t}`).then()};await T(t);let i=[...u.scaffoldTemplateFiles,u.swiftSourceContentsTemplateFile(e.template),u.contentsTemplateFile(e.platform)];try{await Promise.all(i.map(async r=>{let s=t;r.path&&(s=P.join(s,r.path),await T(s)),s=P.join(s,[r.name,r.extension].join(".")),await L(s,(0,N.default)(r.contents))}))}catch(r){try{await I(t,{recursive:!0})}catch(s){console.error(s)}throw r}return{name:e.name,path:t,alreadyExists:!1,open:()=>x(`open ${t}`).then()}}static async makeSwiftPlaygroundPath(e,n,t){let i="",r=null,s=(0,R.default)(e);do{let f=new Date().toLocaleDateString("en-CA"),g=r==null?`${n}-${f}.playground`:`${n}-${f}-${r}.playground`;i=P.join(s,g),r=r==null?1:r+1}while(await F(i)&&t);return i}static contentsTemplateFile(e){return{name:"contents",extension:"xcplayground",contents:`
      <?xml version="1.0" encoding="UTF-8" standalone="yes"?>
      <playground version='5.0' 
                  target-platform='${e.toLocaleLowerCase()}' 
                  buildActiveScheme='true' 
                  executeOnSourceChanges='false' 
                  importAppTypes='true'>
          <timeline fileName='timeline.xctimeline'/>
      </playground>
      `}}static swiftSourceContentsTemplateFile(e){let n;switch(e){case"Empty":n=`import Foundation

`;break;case"SwiftUI":n=`
        import PlaygroundSupport
        import SwiftUI
        
        struct ContentView: View {
        
            var body: some View {
                Text("Hello World")
            }
            
        }
        
        PlaygroundPage.current.liveView = UIHostingController(rootView: ContentView())
        `;break;case"UIKit":n=`
        import Foundation
        import PlaygroundSupport
        import UIKit

        class ViewController : UIViewController {
          override func viewDidLoad() {
            super.viewDidLoad()
          }
        }

        let viewController = ViewController()
        viewController.view.frame = CGRect(x: 0, y: 0, width: 300, height: 600)
        PlaygroundPage.current.liveView = viewController
        PlaygroundPage.current.needsIndefiniteExecution = true
        `;break}return{name:"Contents",extension:"swift",contents:n}}},p=u;p.scaffoldTemplateFiles=[{name:"timeline",extension:"xctimeline",contents:`
      <?xml version="1.0" encoding="UTF-8"?>
      <Timeline version="3.0">
         <TimelineItems>
         </TimelineItems>
      </Timeline>
      `},{path:"playground.xcworkspace",name:"contents",extension:"xcworkspacedata",contents:`
      <?xml version="1.0" encoding="UTF-8"?>
      <Workspace version="1.0">
        <FileRef location="group:self:">
        </FileRef>
      </Workspace>
      `}];var d=require("@raycast/api");async function K(o,e,n,t){let i=await(0,d.showToast)({style:d.Toast.Style.Animated,title:o});try{let r=await t();return i.style=d.Toast.Style.Success,i.title=e,{isSuccess:!0,result:r,toast:i}}catch(r){return console.error(r),i.style=d.Toast.Style.Failure,i.title=n,i.message=`${r}`,{isSuccess:!1,toast:i}}}var y=m(require("node:path"),1),H=m(require("node:os"),1),W=H.default.homedir();function C(o){let e=y.default.normalize(o)+y.default.sep;return(e.startsWith(W)?e.replace(W+y.default.sep,`~${y.default.sep}`):e).slice(0,-1)}var b=require("react"),l=require("react/jsx-runtime");function z(){let o=(0,a.useNavigation)(),[e,n]=(0,b.useState)(),[t,i]=(0,b.useState)();return(0,l.jsxs)(a.Form,{actions:(0,l.jsxs)(a.ActionPanel,{children:[(0,l.jsx)(a.Action.SubmitForm,{title:"Open or create Swift Playground",onSubmit:r=>M(r,o,!1)}),(0,l.jsx)(a.Action.SubmitForm,{title:"Create Swift Playground",onSubmit:r=>M(r,o,!0)})]}),children:[(0,l.jsx)(a.Form.TextField,{id:"name",title:"Name",defaultValue:"MyPlayground",error:e,onChange:()=>{e&&e.length>0&&n(void 0)},onBlur:r=>{r.target.value?.length==0?n("Please enter a name."):e&&e.length>0&&n(void 0)}}),(0,l.jsx)(a.Form.TextField,{id:"location",title:"Location",defaultValue:p.defaultSwiftPlaygroundLocation,error:t,onChange:()=>{t&&t.length>0&&i(void 0)},onBlur:r=>{r.target.value?.length==0?i("Please enter a location."):t&&t.length>0&&i(void 0)}}),(0,l.jsx)(a.Form.Dropdown,{id:"platform",title:"Platform",defaultValue:"ios",children:Object.keys(S).map(r=>r.toLocaleLowerCase()).map(r=>(0,l.jsx)(a.Form.Dropdown.Item,{value:r,title:r.replace("os","OS")},r))}),(0,l.jsx)(a.Form.Dropdown,{id:"template",title:"Template",defaultValue:"Empty",children:Object.keys(h).map(r=>(0,l.jsx)(a.Form.Dropdown.Item,{value:r,title:r},r))}),(0,l.jsx)(a.Form.Checkbox,{id:"open",label:"Open in Xcode after creation",defaultValue:!0})]})}async function M(o,e,n){if(!o.name||!o.location)return;let t=await K("Creating Swift Playground","Swift Playground successfully created","An error occurred while trying to create the Swift Playground",async()=>await p.createSwiftPlayground(o,n));if(!t.result)return;if(t.result.alreadyExists&&!o.open){t.toast.style=a.Toast.Style.Failure,t.toast.title="Swift Playground already exists";return}let i=["Swift Playground",t.result.alreadyExists?"opened":"created","at",C(t.result.path)].join(" ");if(o.open)try{await t.result.open(),await(0,a.showHUD)(i)}catch{t.toast.style=a.Toast.Style.Failure,t.toast.title="Swift Playground could not be opened"}else t.toast.title=i;e.pop()}var oe=require("react/jsx-runtime"),te=()=>(0,oe.jsx)(z,{});0&&(module.exports={});
