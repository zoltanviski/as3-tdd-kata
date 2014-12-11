package cases
{
	import flash.events.EventDispatcher;
	import flexunit.framework.Assert;
	import flexunit.framework.TestCase;
	import hu.vizoli.api.language.constant.CLanguages;
	import hu.vizoli.api.language.model.LanguageModel;
	import hu.vizoli.api.language.service.LanguageService;
	import hu.vizoli.api.language.service.parser.XMLLanguageParser;
	import hu.vizoli.tddexercise.multilanguage.service.mock.LangEnXMLMock;
	import hu.vizoli.tddexercise.multilanguage.service.mock.LangHuXMLMock;
	import hu.vizoli.tddexercise.multilanguage.view.LayoutMediator;
	import hu.vizoli.tddexercise.multilanguage.view.LayoutView;
	import mockolate.runner.MockolateRule;
	import robotlegs.bender.extensions.localEventMap.impl.EventMap;
	
	/**
	 * MultiLanguageTest
	 * 
	 * @author vizoli
	 */
	[RunWith("org.flexunit.runners.Parameterized")]
	public class LanguageServiceTest extends TestCase 
	{
		private var _languageService:LanguageService;
		private var _languageHuXML:XML;
		private var _languageEnXML:XML;
		private var _xmlLanguageParser:XMLLanguageParser;
		private var _languageModel:LanguageModel;
		private var _layoutView:LayoutView;
		private var _layoutMediator:LayoutMediator;
		
		[Before]
		override public function setUp():void 
		{
			this._xmlLanguageParser 			= new XMLLanguageParser;
			
			this._languageModel 				= new LanguageModel();
			this._languageModel.eventDispatcher = new EventDispatcher();
			
			this._languageService 				= new LanguageService();
			this._languageService.parser 		= this._xmlLanguageParser
			this._languageService.languageModel = this._languageModel;
			
			this._languageHuXML 				= XML( new LangHuXMLMock.LanguageHuXML );
			this._languageEnXML 				= XML( new LangEnXMLMock.LanguageEnXML );
			
			this._layoutView 					= new LayoutView();
			
			this._layoutMediator 				= new LayoutMediator();
			this._layoutMediator.view 			= this._layoutView;
		}
		
		[After]
		override public function tearDown():void 
		{
			this._xmlLanguageParser = null;
			
			this._languageService = null;
		}
		
		[Test]
		public function testLanguageAdding( ):void
		{
			this.addHuLanguage();
			
			Assert.assertEquals( 1, this._languageService.languageModel.languagesCount );
			
			this.addEnLanguage();
			
			Assert.assertEquals( 2, this._languageService.languageModel.languagesCount );
			
			this.addEnLanguage();
			this.addEnLanguage();
			this.addEnLanguage();
			
			Assert.assertEquals( 2, this._languageService.languageModel.languagesCount );
		}
		
		[Test]
		public function testCurrentLanguageWillBeTheFirstLanguage( ):void
		{
			this.addHuLanguage();
			
			Assert.assertEquals( CLanguages.HU, this._languageService.languageModel.currentLanguage );
		}
		
		[Test]
		public function testGetExistLanguageElement( ):void
		{
			this.addHuLanguage();
			
			Assert.assertEquals( "Elso bejegyzes", this._languageService.languageModel.getText( "first" ) );
			Assert.assertEquals( "Masodik bejegyzes", this._languageService.languageModel.getText( "second" ) );
		}
		
		[Test]
		public function testGetExistLanguageAfterUpdatedCurrentLanguage( ):void
		{
			this.addHuLanguage();
			
			Assert.assertEquals( "Elso bejegyzes", this._languageService.languageModel.getText( "first" ) );
			Assert.assertEquals( "Masodik bejegyzes", this._languageService.languageModel.getText( "second" ) );
			
			this.addEnLanguage();
			
			this._languageService.languageModel.currentLanguage = CLanguages.EN;
			
			Assert.assertEquals( "First note", this._languageService.languageModel.getText( "first" ) );
			Assert.assertEquals( "Second note", this._languageService.languageModel.getText( "second" ) );
			
			this._languageService.languageModel.currentLanguage = CLanguages.HU;
			
			Assert.assertEquals( "Elso bejegyzes", this._languageService.languageModel.getText( "first" ) );
			Assert.assertEquals( "Masodik bejegyzes", this._languageService.languageModel.getText( "second" ) );
		}
		
		[Test]
		public function testGetPassedKeyIfKeyDoesntExistInLanguage( ):void
		{
			this.addHuLanguage();
			
			Assert.assertEquals( "notExistKey", this._languageService.languageModel.getText( "notExistKey" ) );
		}
		
		[Test]
		public function testCurrentLanguageIfNotUpdateing( ):void
		{
			this.addHuLanguage();
			
			Assert.assertEquals( CLanguages.HU, this._languageService.languageModel.currentLanguage );
			
			this.addEnLanguage();
			
			Assert.assertEquals( CLanguages.HU, this._languageService.languageModel.currentLanguage );
		}
		
		[Test]
		public function testCurrentLanguageAfterUpdateing( ):void
		{
			this.addHuLanguage();
			
			Assert.assertEquals( CLanguages.HU, this._languageService.languageModel.currentLanguage );
			
			this.addEnLanguage();
			
			this._languageService.languageModel.currentLanguage = CLanguages.EN;
			
			Assert.assertEquals( CLanguages.EN, this._languageService.languageModel.currentLanguage );
		}
		
		[Test(expects="Error")]
		public function testCurrentLanguageSetToNotExistingLanguage( ):void
		{
			this.addHuLanguage();
			
			this._languageService.languageModel.currentLanguage = CLanguages.EN;
		}
		
		//[Test]
		public function testViewUpdateingTextsAfterLanguageUpdated( ):void
		{
			this.addHuLanguage();
			
			Assert.assertEquals( CLanguages.HU, this._languageService.languageModel.currentLanguage );
			
			this._layoutMediator.eventMap = new EventMap();
			this._layoutMediator.eventDispatcher = new EventDispatcher();
			this._layoutMediator.initialize();
			Assert.assertEquals( "Elso bejegyzes", this._layoutMediator.view.getFirstText() );
		}
		
		/**
		 * Add hu language
		 */
		private function addHuLanguage():void
		{
			this._languageService.addLanguage( this._languageHuXML, LangHuXMLMock.LANGUAGE );
		}
		
		/**
		 * Add en language
		 */
		private function addEnLanguage():void
		{
			this._languageService.addLanguage( this._languageEnXML, LangEnXMLMock.LANGUAGE );
		}
	}

}