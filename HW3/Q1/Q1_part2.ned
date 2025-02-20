package hw3_q1_2.simulations;

import inet.node.ethernet.Eth10M;
import inet.node.ethernet.EthernetHost;
import inet.node.ethernet.EthernetHub;
import inet.node.ethernet.EthernetSwitch;
import inet.showcases.wireless.sensornetwork.ManetSensorNode;


@license(LGPL);
//
// TODO documentation
//
network Ethernet_network
{
    @display("bgb=739,591");
    submodules:
        ethernetHost3: EthernetHost {
            @display("p=352,68");
        }
        ethernetHost2: EthernetHost {
            @display("p=178,129");
        }
        ethernetHost1: EthernetHost {
            @display("p=90,273");
        }
        ethernetHost8: EthernetHost {
            @display("p=178,431");
        }
        ethernetHost7: EthernetHost {
            @display("p=352,509");
        }
        ethernetHost6: EthernetHost {
            @display("p=530,431");
        }
        ethernetHost5: EthernetHost {
            @display("p=569,271");
        }
        ethernetHost4: EthernetHost {
            @display("p=530,129");
        }
        ethernetSwitch: EthernetSwitch {
            @display("p=351.05,279.65");
             gates:
                ethg[8];
        }
    connections:
        ethernetHost4.ethg <--> Eth10M <--> ethernetSwitch.ethg[3];
        ethernetHost3.ethg <--> Eth10M <--> ethernetSwitch.ethg[2];
        ethernetHost2.ethg <--> Eth10M <--> ethernetSwitch.ethg[1];
        ethernetHost1.ethg <--> Eth10M <--> ethernetSwitch.ethg[0];
        ethernetHost8.ethg <--> Eth10M <--> ethernetSwitch.ethg[7];
        ethernetHost7.ethg <--> Eth10M <--> ethernetSwitch.ethg[6];
        ethernetHost6.ethg <--> Eth10M <--> ethernetSwitch.ethg[5];
        ethernetHost5.ethg <--> Eth10M <--> ethernetSwitch.ethg[4];
}


