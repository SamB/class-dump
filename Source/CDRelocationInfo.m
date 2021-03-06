// -*- mode: ObjC -*-

//  This file is part of class-dump, a utility for examining the Objective-C segment of Mach-O files.
//  Copyright (C) 1997-1998, 2000-2001, 2004-2012 Steve Nygard.

#import "CDRelocationInfo.h"

@implementation CDRelocationInfo
{
    struct relocation_info rinfo;
}

- (id)initWithInfo:(struct relocation_info)info;
{
    if ((self = [super init])) {
        rinfo = info;
    }

    return self;
}

#pragma mark - Debugging

- (NSString *)description;
{
    return [NSString stringWithFormat:@"<%@:%p> addr/off: %08x, sym #: %5u, pcrel? %u, len: %u, extern? %u, type: %x",
            NSStringFromClass([self class]), self,
            rinfo.r_address, rinfo.r_symbolnum, rinfo.r_pcrel, rinfo.r_length, rinfo.r_extern, rinfo.r_type];
}

#pragma mark -

- (NSUInteger)offset;
{
    return rinfo.r_address;
}

- (CDRelocationSize)size;
{
    return rinfo.r_length;
}

- (uint32_t)symbolnum;
{
    return rinfo.r_symbolnum;
}

- (BOOL)isExtern;
{
    return rinfo.r_extern == 1;
}

@end
