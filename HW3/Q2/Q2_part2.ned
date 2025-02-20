package hw3_q2.simulations;

import inet.networklayer.configurator.ipv4.Ipv4NetworkConfigurator;
import inet.node.ethernet.Eth100M;
import inet.node.ethernet.EthernetHost;
import inet.node.ethernet.EthernetSwitch;
import inet.node.inet.StandardHost;


@license(LGPL);
//
// TODO documentation
//
network VLANNetwork
{
    @display("bgb=721,526");
    submodules:
        Switch1: EthernetSwitch {
            @display("p=228,273");
            gates:
                ethg[4];
        }
        Switch2: EthernetSwitch {
            @display("p=450,273");
            gates:
                ethg[4];
        }
        PC1: EthernetHost {
            @display("p=120,142");
        }
        PC2: EthernetHost {
            @display("p=47,274");
        }
        PC3: EthernetHost {
            @display("p=120,390");
        }
        PC4: EthernetHost {
            @display("p=549,142");
        }
        PC5: EthernetHost {
            @display("p=609,274");
        }
        PC6: EthernetHost {
            @display("p=549,390");
        }
        configurator: Ipv4NetworkConfigurator {
            @display("p=58,60");
        }
    connections:
        PC4.ethg <--> Eth100M <--> Switch2.ethg[1];
        PC5.ethg <--> Eth100M <--> Switch2.ethg[2];
        PC6.ethg <--> Eth100M <--> Switch2.ethg[3];
        Switch2.ethg[0] <--> Eth100M <--> Switch1.ethg[0];
        Switch1.ethg[1] <--> Eth100M <--> PC1.ethg;
        Switch1.ethg[2] <--> Eth100M <--> PC2.ethg;
        Switch1.ethg[3] <--> Eth100M <--> PC3.ethg;
}

