# starlingbuilder-haxe
 A haxe port of [Starling Builder](https://starlingbuilder.github.io/)'s Engine code. 

Demo http://starlingbuilder.github.io/demo-haxe/index.html

# What is Starling Builder?
Starling Builder is an open source UI editor for Starling. It's built on top of Starling and Feathers UI framework. You can edit your user interfaces in Starling Builder, export them to JSON layout files, and create the starling display objects directly in the game. It provides an WYSIWYG way to create any in-game UI in minutes.

Starling Builder is backed by SGN Games Inc, one of the fastest growing mobile game company in US,
proven by our top grossing games Juice Jam, Book of Life: Sugar Smash and more,
and recommended by the official Starling website.

## Why to choose?
* Deeply integrate with Starling and Feathers UI Framework
* Engine is a single code base that supports both Starling 1.x and 2.x and runs on everywhere
* Engine is super lightweight and very stable (adding only <1000 lines of code to your project)
* Editor is user friendly and easy to master
* Flexible architecture, almost everything is configurable and extendable
* Everything is open source(engine, editor, extensions), you get all of them to be able to extend the tools
* Support HTML5 target through its Haxe runtime

## Features supported
* Create and edit Starling/Feathers/Custom UI elements
* Customize components and its editable properties (through config file)
* Nested components (through Sprite/LayoutGroup/ScrollContainer etc.)
* Nested layout (a layout contains another layout)
* Slice 3/9 editor for Image
* Custom UI Components extension (through loading swf files)
* Custom Feathers Theme extension (through loading swf files)
* Custom Component Class (create a generic game-agnostic class in editor but initiate a custom game-specific class in game)
* Display object binding (automatically bind display object from layout data to properties in UI class)
* Multiple resolution support (only need one set of layout files to run on any devices)
* Localization build-in support
* Starling filters support
* Starling mask support
* Feathers layout support
* Feathers data provider support
* Starling tween support
* Distance field style support
* Dynamic lighting support (through custom UI component extension)
