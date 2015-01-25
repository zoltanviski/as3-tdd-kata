package cases
{
	import flexunit.framework.Assert;
	import flexunit.framework.TestCase;
	import hu.vizoli.tddkata.binarysearch.util.SearchUtil;
	
	/**
	 * A binaris search-t tesztelo osztaly
	 * 
	 * @author vizoli
	 */
	[RunWith("org.flexunit.runners.Parameterized")]
	public class BinarySearchTest extends TestCase 
	{
		public static var three:Array 		= [ 1, 3, 5 ];
		public static var four:Array 		= [ 1, 3, 5, 7 ];
		public static var long:Array 		= [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31 ];
		
		public static var testDatas:Array 	= [   	
												[ [ ], 									3, 		-1 ],
												[ [ 1 ], 								3, 		-1 ],
												[ [ 1 ], 								1, 		 0 ], 
												[ three, 								1, 		 0 ], 
												[ three, 								3, 		 1 ], 
												[ three, 								5, 		 2 ],
												[ three, 								0, 		-1 ],
												[ three, 								2, 		-1 ],
												[ three, 								4, 		-1 ],
												[ three, 								6, 		-1 ],
												[ four, 								1, 		 0 ],
												[ four, 								3, 		 1 ],
												[ four, 								5, 		 2 ],
												[ four, 								7, 		 3 ],
												[ four, 								0, 		-1 ],
												[ four, 								2, 		-1 ],
												[ four,									4, 		-1 ],
												[ four,									6, 		-1 ],
												[ four, 								8, 		-1 ],
												[ [ 1, 3, 5, 7, 8, 10, 11, 22, 23 ], 	22, 	 7 ],
												[ [ 1, 3, 5, 7, 8, 10, 15, 22, 23 ], 	15, 	 6 ],
												[ long, 								5, 		 4 ]
											  ];
		
		[Before]
		override public function setUp():void 
		{
			
		}
		
		[After]
		override public function tearDown():void 
		{
			
		}
		
		[Test(dataProvider="testDatas")]
		public function testBinarySearch( array:Array, seaerchFor:Number, expected:Number ):void
		{
			Assert.assertEquals( expected, SearchUtil.binarySearch3( array, String( seaerchFor ) ) );
		}
	}

}