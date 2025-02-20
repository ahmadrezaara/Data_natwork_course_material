package hw4_q2_1.simulations;
import inet.networklayer.configurator.ipv4.Ipv4NetworkConfigurator;
import inet.node.inet.ManetRouter;
import inet.node.gpsr.GpsrRouter;
import inet.physicallayer.wireless.ieee80211.packetlevel.Ieee80211ScalarRadioMedium;
import inet.visualizer.common.IntegratedMultiVisualizer;
@license(LGPL);

network AODV
{
    parameters:
        @display("bgb=1100,1100,,,0");
        @statistic[numRcvdPk](source=count(source.app[0].pingRxSeq); record=figure; targetFigure=numRcvdPkCounter; checkSignals=false);
        @figure[numRcvdPkCounter](type=counter; transform=scale(0.5); pos=50,300; label="Received ping replies"; decimalPlaces=4);
        @statistic[numLost](source=count(source.app[0].numLost); record=figure; targetFigure=numLostPkCounter; checkSignals=false);
        @figure[numLostPkCounter](type=counter; transform=scale(0.5); pos=50,400; label="Pings lost"; decimalPlaces=4);

    submodules:
        source: ManetRouter {
            @display("p=550,587");
        }
        node1: ManetRouter {
            @display("p=658,505");
        }
        node2: ManetRouter {
            @display("p=422,505");
        }
        node3: ManetRouter {
            @display("p=542,466");
        }
        node4: ManetRouter {
            @display("p=329,427");
        }
        node6: ManetRouter {
            @display("p=422,375");
        }
        node7: ManetRouter {
            @display("p=329,280");
        }
        destination: ManetRouter {
            @display("p=542,106");
        }
        radioMedium: Ieee80211ScalarRadioMedium {
            @display("p=975,521");
        }
        configurator: Ipv4NetworkConfigurator {
            @display("p=975,679");
        }
        visualizer: IntegratedMultiVisualizer {
            @display("p=975,600");
        }
        node5: ManetRouter {
            @display("p=715,427");
        }
        node9: ManetRouter {
            @display("p=630,367");
        }
        node8: ManetRouter {
            @display("p=716,261");
        }
        node10: ManetRouter {
            @display("p=632,172");
        }
        node11: ManetRouter {
            @display("p=429,187");
        }
}

