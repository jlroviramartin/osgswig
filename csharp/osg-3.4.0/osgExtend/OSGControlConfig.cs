using System.Threading;

namespace OSGDLL
{
    public class OSGControlConfig
    {
        public OSGControlConfig(bool useThread, ThreadPriority threadPriority, bool useTimer, int timerInterval, bool useGraphicsThread)
        {
            this.UseThread = useThread;
            this.ThreadPriority = threadPriority;
            this.UseTimer = useTimer;
            this.TimerInterval = timerInterval;
            this.UseGraphicsThread = useGraphicsThread;
        }

        public readonly bool UseThread = true;
        public readonly ThreadPriority ThreadPriority = ThreadPriority.BelowNormal;

        public readonly bool UseTimer = false;
        public readonly int TimerInterval = 20;

        public readonly bool UseGraphicsThread = false;
    }
}