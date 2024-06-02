package;

import haxe.io.Bytes;
import haxe.io.Path;
import lime.utils.AssetBundle;
import lime.utils.AssetLibrary;
import lime.utils.AssetManifest;
import lime.utils.Assets;

#if sys
import sys.FileSystem;
#end

#if disable_preloader_assets
@:dox(hide) class ManifestResources {
	public static var preloadLibraries:Array<Dynamic>;
	public static var preloadLibraryNames:Array<String>;
	public static var rootPath:String;

	public static function init (config:Dynamic):Void {
		preloadLibraries = new Array ();
		preloadLibraryNames = new Array ();
	}
}
#else
@:access(lime.utils.Assets)


@:keep @:dox(hide) class ManifestResources {


	public static var preloadLibraries:Array<AssetLibrary>;
	public static var preloadLibraryNames:Array<String>;
	public static var rootPath:String;


	public static function init (config:Dynamic):Void {

		preloadLibraries = new Array ();
		preloadLibraryNames = new Array ();

		rootPath = null;

		if (config != null && Reflect.hasField (config, "rootPath")) {

			rootPath = Reflect.field (config, "rootPath");

			if(!StringTools.endsWith (rootPath, "/")) {

				rootPath += "/";

			}

		}

		if (rootPath == null) {

			#if (ios || tvos || webassembly)
			rootPath = "assets/";
			#elseif android
			rootPath = "";
			#elseif (console || sys)
			rootPath = lime.system.System.applicationDirectory;
			#else
			rootPath = "./";
			#end

		}

		#if (openfl && !flash && !display)
		
		#end

		var data, manifest, library, bundle;

		data = '{"name":null,"assets":"aoy4:pathy36:assets%2Ftextures%2FArialUnicode.fnty4:sizei37855y4:typey4:TEXTy2:idR1goR0y36:assets%2Ftextures%2FArialUnicode.pngR2i259775R3y5:IMAGER5R6goR0y29:assets%2Ftextures%2FAtlas.pngR2i585914R3R7R5R8goR0y29:assets%2Ftextures%2FAtlas.xmlR2i3022R3R4R5R9goR0y36:assets%2Flocalization%2Fstrings.jsonR2i247R3R4R5R10y7:preloadtgoR0y31:assets%2Flayouts%2Fmain_ui.jsonR2i14135R3R4R5R12R11tgh","rootPath":null,"version":2,"libraryArgs":[],"libraryType":null}';
		manifest = AssetManifest.parse (data, rootPath);
		library = AssetLibrary.fromManifest (manifest);
		Assets.registerLibrary ("default", library);
		

		library = Assets.getLibrary ("default");
		if (library != null) preloadLibraries.push (library);
		else preloadLibraryNames.push ("default");
		

	}


}

#if !display
#if flash

@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_textures_arialunicode_fnt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_textures_arialunicode_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_textures_atlas_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_textures_atlas_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_localization_strings_json extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_layouts_main_ui_json extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__manifest_default_json extends null { }


#elseif (desktop || cpp)

@:keep @:file("Assets/localization/strings.json") @:noCompletion #if display private #end class __ASSET__assets_localization_strings_json extends haxe.io.Bytes {}
@:keep @:file("Assets/layouts/main_ui.json") @:noCompletion #if display private #end class __ASSET__assets_layouts_main_ui_json extends haxe.io.Bytes {}
@:keep @:file("") @:noCompletion #if display private #end class __ASSET__manifest_default_json extends haxe.io.Bytes {}



#else



#end

#if (openfl && !flash)

#if html5

#else

#end

#end
#end

#end