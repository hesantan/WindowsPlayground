using Xunit;

namespace WindowsPlayground.Test
{
	public class PlaygroundTest
	{
		private readonly Playground _playground;

		public PlaygroundTest()
		{
			_playground = new Playground();
		}

		[Fact]
		public void ToString_Test()
		{
			var playgroundString = _playground.ToString();

			Assert.False(string.IsNullOrEmpty(playgroundString));
		}
	}
}