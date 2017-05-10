using System;

namespace WindowsPlayground
{
	public class Playground
	{
		private Guid _guid;

		public Playground()
		{
			_guid = Guid.NewGuid();
		}

		public override string ToString()
		{
			return _guid.ToString();
		}
	}
}
