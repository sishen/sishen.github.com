---
title: "What you should know before starting node-webkit"
date: 2014-08-01 09:00 +08:00
tags: node-webkit
keywords: node-webkit
---

<aside class="aside">
  ![node-webkit](http://yedingding.com/images/node-webkit-intro/nw.jpg)
</aside>

<blockquote>
  This article is translated by <a href="http://www.linkedin.com/in/yicunwu">Wendy</a> of my article <a href="http://yedingding.com/2014/07/28/node-webkit-intro.html">开始 NODE-WEBKIT 前，你应该知道的</a>. <a href="http://www.linkedin.com/in/yicunwu">Wendy</a> now lives in Toronto, Canada and is looking to join a startup in US or Canada as backend developer to build innovative products that make people's lives easier and more efficient. Her skills include Node.js, PHP, Python and C++. If you're interested, why not <a href="mailto:yicun.wu@uwaterloo.ca">drop her an email</a>?
</blockquote>

Last weekend, [Teahour](http://teahour.fm/2014/07/22/node-webkit-with-rogerwang.html) invited [Roger Wang](https://twitter.com/wwr), the creator of node-webkit to talk about the stories behind node-webkit and the use of HTML5 in desktop app development. Various web-based desktop app frameworks such as node-webkit, Chrome Apps, Titanium, TideSDK and Atom Shell have been developed over recent years and node-webkit remains one of the best.

The [node-webkit](https://github.com/rogerwang/node-webkit) project was started in 2011. It is an app runtime that allows developers to use Web technologies (i.e. HTML5, CSS and JavaScript) to develop native apps. As developers, we only need to maintain one codebase which can be compiled to Windows, Mac and Linux native apps. The node-webkit project currently has almost 15000 Stars and over 1600 Forks on GitHub and it's a very popular open source project built by a Chinese developer. In the episode, Roger introduced the following common categories of apps using node-webkit:

* Desktop IDEs such as [Light Table](http://www.lighttable.com/)
* Games such as [Brandon Must Die!](http://www.brandonmustdie.com/)
* Media apps such as [Popcorn Time](http://popcorntime.io/)
* Tools such as [Haroopod](http://pad.haroopress.com/)
* Enterprise apps such as metrics apps
* Terminals such as POS terminals

We could see that the apps are diverse and there's no lack of elegant apps. The full of imagination can be attributed to hardware performance improvements, developments of Web, animations, graphics, audios, videos, 2D, 3D, WebGl, etc.

Essentially, node-webkit is only a web app runtime. When we talk about desktop apps, we think of GUI, responses to user actions and system-level interactions, so how did node-webkit manage to do that? In order to learn more about that, we need to first learn about Node and WebKit.

Node is a lightweight JavaScript runtime based on the Google Chrome V8 engine. Node is written in C++ and lives in the operating-system application layer where it supports a lot of OS APIs such as file system and network operations therefore it can be used to build system and server-side apps.

WebKit is a web browser engine. Let's take a web page as an example: it's built with HTML, CSS and JavaScript. After the page is loaded, it will be parsed into a tree and handed off to WebKit for rendering hence forming the page we see in a browser. Node-webkit is based on Blink, which is a rendering engine forked from WebKit and whose JavsScript engine is V8, which is also used in Node.

The browser security model prevents WebKit from issuing system calls, which is a must-have for desktop applications; since Node itself has system-level APIs but lacks rendering support, Roger had the idea in 2011 to create node-webkit, combining system-level operations and user interactions. After some trials with WebKitGTK and Node, he started using Chromium in 2012, basing the project entirely on Chromium from the initial Chromium Embedded Framework (CEF).

Following the fast development of Node and Chromium, node-webkit is at version 0.10 today. We'll dive into the details of how node-webkit works.

Node is an event-driven framework with message processing based on libuv. The JS engine of WebKit is based on MessagePump of Chrome, which is also event-driven. Event-driven can be explained as when an event happens, for example, user input comes in, the corresponding code is executed to process the event. Node-webkit combines the event-processing of Node and WebKit into a single message loop.

We still have another challenge after combining event processing: we need to find a way for Node and WebKit to access the context of each other. There are two contexts in node-webkit: the Node context and the WebKit context. Accessing the context of each other means accessing the objects of each other, so during the initialization of node-webkit, the Node context will be injected into WebKit so that the WebKit context will have access to the Node context.

Node-webkit has made changes to the security model of WebKit as well. In node-webkit, there are two kinds of frames: Node frames and normal frames[^1]. If you're familiar with Web development, you probably know that issuing a cross-domain AJAX request will result in errors imposed by [same-origin policy](http://en.wikipedia.org/wiki/Same_origin_policy). The same restriction is imposed on normal frames of node-webkit as in a browser. However, there is no such restriction on Node frames: the same security token is shared in all Node frames, including the Node's context and the WebKit's Context, and cross-domain access are allowed and objects in the Node's context are accessible too. Therefore, app developers must take precaution with untrusted user input to prevent destructive actions or put them into a normal frame.

<aside class="aside">
  ![Chromium Layers](http://yedingding.com/images/node-webkit-intro/chromium-layers.jpg)
  <small>Chromium Conceptual Application Layers</small>
</aside>

It is worth noting that even though Chrome supports HTML5 pretty well, some features are implemented on the Browser layer (see the graph above) and the WebKit in node-webkit inherits up to the Contents layer (i.e. the WebContents layer on the above image) as node-webkit itself is the implementation of the Browser layer. Therefore, some HTML5 features such as Web Notification[^2] are not supported in node-webkit. Nevertheless, the Chromium team is moving these HTML5 features onto the Content layer, which is definitely good news for node-webkit.

If you look at the above graph carefully, you will find there is also UI rendering in the Browser layer. Node-webkit implements UI rendering in the same way: it has native UI component APIs such as Menu, System Tray, Clipboard etc. The implementation is inspired from the cross-platform UI of Chromium.

The current version of node-webkit is 0.10.0, based on Node v0.11.13 and Chromium v35.0.1916.113. Node-webkit bases its major updates on Chromium versions, hence the 10 in 0.10.0. The version change corresponding to Node or node-webkit itself is the third part of the version number, e.g. the last 0 in 0.10.0.

If you would like to learn more about node-webkit, you can listen to our [Teahour Episode](http://teahour.fm/2014/07/22/node-webkit-with-rogerwang.html). If you are tempted to develop a cross-platform desktop app, then the official [Wiki](https://github.com/rogerwang/node-webkit/wiki) would definitely be a good place to start.

<span class="footnotes">
  Thank you again for the translation, Wendy. If anyone is interested, check out her <a href="http://www.linkedin.com/in/yicunwu">linkedin</a>. Wish you all the best in the job hunting.
</span>

[^1]: Please refer to https://github.com/rogerwang/node-webkit/wiki/Security to learn more about the node-webkit security model and and how to use these two kinds of frames.

[^2]: Notification has been implemented by [PR](https://github.com/rogerwang/node-webkit/pull/1951) and it's already included in latest release 0.10.1.
