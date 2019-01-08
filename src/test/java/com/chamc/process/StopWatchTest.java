package com.chamc.process;

import org.junit.Test;
import org.springframework.util.StopWatch;

import java.util.UUID;
import java.util.concurrent.TimeUnit;

public class StopWatchTest {

    @Test
    public void testUUID() {
        String s = UUID.randomUUID().toString();
        System.out.println(s);
    }

    @Test
    public void testStopwatch() throws InterruptedException {
        StopWatch stopWatch = new StopWatch(UUID.randomUUID().toString());
        stopWatch.start("request log" );
        TimeUnit.SECONDS.sleep(5L);
        stopWatch.stop();
        String s = stopWatch.prettyPrint();
        System.out.println(s);
        String s1 = stopWatch.shortSummary();
        System.out.println(s1);
    }
}
