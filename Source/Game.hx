package;

import starling.text.TextField;
import starling.events.Event;
import haxe.Json;
import starlingbuilder.engine.localization.DefaultLocalization;
import starlingbuilder.engine.localization.ILocalization;
import feathers.starling.layout.AnchorLayout;
import feathers.starling.layout.HorizontalLayout;
import feathers.starling.layout.VerticalLayout;
import feathers.starling.layout.TiledRowsLayout;
import feathers.starling.controls.LayoutGroup;
import feathers.starling.controls.ScrollContainer;
import starling.display.MovieClip;
import starling.assets.AssetManager;
import starlingbuilder.engine.UIBuilder;
import starlingbuilder.engine.IUIBuilder;
import starlingbuilder.engine.LayoutLoader;
import starling.display.DisplayObject;
import starling.events.ResizeEvent;
import starling.core.Starling;
import starling.display.Image;
import openfl.Assets;
import starling.display.Sprite;
import starling.display.Button;

@:keep
class Game extends Sprite {
	public static var assetManager:AssetManager;

	private var _assetMediator:AssetMediator;
	private var _sprite:Sprite;
	private var _params:Map<DisplayObject, Dynamic>;

	public var _scrollContainer:ScrollContainer = null;
	public var _play_btn:Button = null;
	public var _bird_mc:MovieClip;
	public var _button_en:Button;
	public var _button_fr:Button;
	public var _button_de:Button;
	public var _button_es:Button;

	public static var uiBuilder:IUIBuilder;
	public static var linkers:Array<Dynamic> = [
		Button,
		LayoutGroup,
		AnchorLayout,
		ScrollContainer,
		HorizontalLayout,
		VerticalLayout,
		TiledRowsLayout
	];

	public function new() {
		super();
		// var theme:MetalWorksDesktopTheme = new MetalWorksDesktopTheme();
	}

	public function start():Void {
		// new MetalWorksDesktopTheme();
		var localization:ILocalization = new DefaultLocalization(Json.parse(Assets.getText("assets/localization/strings.json")), "en_US");
		trace("localization" + localization);
		assetManager = new AssetManager();
		assetManager.verbose = true;
		_assetMediator = new AssetMediator(assetManager);
		uiBuilder = new UIBuilder(_assetMediator, false, null, localization, null);
		// uiBuilder.localizationHandler = new LocalizationHandler();
		var loader:LayoutLoader = new LayoutLoader(ParsedLayouts);
		assetManager.enqueue([
			Assets.getPath("assets/textures/Atlas.png"),
			Assets.getPath("assets/textures/Atlas.xml"),
			Assets.getPath("assets/textures/ArialUnicode.fnt")
		]);
		assetManager.loadQueue(onComplete, onError, onProgress);

		Starling.current.stage.addEventListener(ResizeEvent.RESIZE, onResize);
	}

	function onComplete():Void {
		trace("Assets Loaded");
		_sprite = new Sprite();
		// _sprite = cast uiBuilder.create(ParsedLayouts.main_ui, false, this);
		var data:Dynamic = uiBuilder.load(ParsedLayouts.main_ui, false, this);
		_sprite = data.object;
		_params = data.params;
		addChild(_sprite);
		_button_en.addEventListener(Event.TRIGGERED, onClick);
		_button_de.addEventListener(Event.TRIGGERED, onClick);
		_button_fr.addEventListener(Event.TRIGGERED, onClick);
		_button_es.addEventListener(Event.TRIGGERED, onClick);

		Starling.current.juggler.add(_bird_mc);
		_bird_mc.play();
		
		onResize(null);
	}

	private function onClick(event:Event, data:Dynamic):Void {
		var locale:String = cast(event.target, Button).text;
		trace("locale : " + locale);
		uiBuilder.localization.locale = locale;
		uiBuilder.localizeTexts(_sprite, _params);
	}

	function onError(msg:String):Void {
		trace(msg);
	}

	function onProgress(ratio:Float):Void {
		trace("loading .. " + ratio);
	}

	public static function round2(num:Float, decimals:Int):Float {
		var m:Int = Std.int(Math.pow(10, decimals));
		return Math.round(num * m) / m;
	}

	private function onResize(event:ResizeEvent):Void {
		center(_sprite);
	}

	private function center(obj:DisplayObject):Void {
		obj.x = (Starling.current.stage.stageWidth - obj.width) * 0.5;
		obj.y = (Starling.current.stage.stageHeight - obj.height) * 0.5;
	}
}
