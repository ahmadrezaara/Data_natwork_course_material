package hw4_q1_1.simulations;

import inet.networklayer.configurator.ipv4.Ipv4FlatNetworkConfigurator;
import inet.networklayer.configurator.ipv4.Ipv4NetworkConfigurator;
import inet.node.ethernet.Eth10G;
import inet.node.ethernet.EthernetHost;
import inet.node.ethernet.EthernetSwitch;
import inet.node.inet.StandardHost;
import inet.node.ospfv2.OspfRouter;


@license(LGPL);
//
// TODO documentation
//
network OSPF
{
    @display("bgb=754,448");
    submodules:
        configurator: Ipv4NetworkConfigurator {
            parameters:

                config = xml("<config>"+
                    "<interface among='host1 host2 R1' address='192.168.1.x' netmask='255.255.255.x' />"+
                    "<interface among='host4 host5 R3' address='192.168.2.x' netmask='255.255.255.x' />"+
                    "<interface among='host3 R1 R2 R3' address='192.168.3.x' netmask='255.255.255.x' />"+
                    "<route hosts='host1 host3' destination='*' netmask='0.0.0.0' interface='eth0' />"+
                    "<route hosts='host4 host3' destination='*' netmask='0.0.0.0' interface='eth0' />"+
                    "<route hosts='host2 host5' destination='*' netmask='0.0.0.0' interface='eth0' />"+
                    "</config>");
                addStaticRoutes = false;
                addDefaultRoutes = false;
                @display("p=47,41;is=s");
        }
        R1: OspfRouter {
            @display("p=265,158");
            gates:
                ethg[2];
        }
        R3: OspfRouter {
            @display("p=487,158");
            gates:
                ethg[2];
        }
        R2: OspfRouter {
            @display("p=369,211");
            gates:
                ethg[3];
        }
        switch2: EthernetSwitch {
            @display("p=369,292");
            gates:
                ethg[2];
        }
        switch3: EthernetSwitch {
            @display("p=554,146");
            gates:
                ethg[3];
        }
        switch1: EthernetSwitch {
            @display("p=185,157");
            gates:
                ethg[3];
        }
        host3: StandardHost {
            @display("p=369,368");
            gates:
                ethg[1];
        }
        host2: StandardHost {
            @display("p=99,104");
            gates:
                ethg[1];
        }
        host1: StandardHost {
            @display("p=96,220");
            gates:
                ethg[1];
        }
        host4: StandardHost {
            @display("p=631,80");
            gates:
                ethg[1];
        }
        host5: StandardHost {
            @display("p=637,193");
            gates:
                ethg[1];
        }
    connections:
        R3.ethg[1] <--> Eth10G <--> R2.ethg[2];
        R2.ethg[1] <--> Eth10G <--> R1.ethg[1];
        R2.ethg[0] <--> Eth10G <--> switch2.ethg[1];
        switch3.ethg[2] <--> Eth10G <--> R3.ethg[0];
        R1.ethg[0] <--> Eth10G <--> switch1.ethg[2];
        host4.ethg[0] <--> Eth10G <--> switch3.ethg[0];
        switch1.ethg[1] <--> Eth10G <--> host2.ethg[0];
        switch1.ethg[0] <--> Eth10G <--> host1.ethg[0];
        switch2.ethg[0] <--> Eth10G <--> host3.ethg[0];
        switch3.ethg[1] <--> Eth10G <--> host5.ethg[0];
}

